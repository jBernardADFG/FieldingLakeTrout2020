#' Function to get the accuracy associated with the Yield Potential estimate
#' 
#' @param A The area of the lake (in XX)
#' @param n An estimate of the number of fish that were weighed
#' @param wts A set of weights to sample from
#' @param n_iter The number of times to run the simulation 
#' @return Returns a vector containing the signed accuacy associated with each iteration of the simulation (given as a percent).
yp.n.acc <- function(A, n, wts, n_iter){
  pred_var <- median(est.pred.var(A))
  yp_n_acc <- log_yp_n_acc <- rep(NA, n_iter)
  sat <- rep(F, n_iter)
  for(i in 1:n_iter){
    # Draw a random weight sample of size n, estimate the mean weight, and variance of this estimate
    wt_samp <- sample(wts,n,replace=T)
    W_hat <- mean(wt_samp)
    V_hat_W_hat <- var(wt_samp)/n
    # Calculate YP_n_hat
    log_YP_hat <- 0.60+0.72*log10(A)
    YP_hat <- 10^log_YP_hat
    YP_n_hat <- YP_hat/W_hat+YP_hat/W_hat^3*V_hat_W_hat
    log_YP_n_hat <-  log10(YP_n_hat)
    # Simulate YP_n
    # pv <- sample(predvar,1)
    log_YP <- rnorm(1, 0.6 + 0.72*log10(A), sqrt(pred_var))
    YP <- 10^log_YP
    W <- W_hat + rnorm(1, 0, sqrt(V_hat_W_hat)) # simulate W
    YP_n <- YP/W # Need to verify that this is how YP_n is defined
    log_YP_n <- log10(YP_n)
    yp_n_acc[i] <- (YP_n-YP_n_hat)/YP_n*100 # Calculate the accuracy of the estimate
    log_yp_n_acc[i] <- (log_YP_n-log_YP_n_hat)/YP_n*100
  }
  return(list(yp_n_acc=yp_n_acc, log_yp_n_acc=log_yp_n_acc))
}

yp.n.acc(A, n, median(wts), 100)
