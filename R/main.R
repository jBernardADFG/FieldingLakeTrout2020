# # Main
# A <- 538
# library(readxl)
# wts <- read_excel("S:/Jordy/fieldingOP2020/Data/Chandler_LAM_L-W_data.xlsx")$`Weight (kg)`
# n <- 200
# n_iter <- 1000
# yp_n_acc <- yp.n.acc(A, n, wts, n_iter)
# quantile(yp_n_acc$yp_n_acc, c(0.025, 0.5, 0.975))
# quantile(yp_n_acc$log_yp_n_acc, c(0.025, 0.5, 0.975))
# 
# # Sensitivity testing
# wts <- wts + sd(wts)
# yp_n_acc <- yp.n.acc(A, n, wts, n_iter)
# quantile(yp_n_acc$yp_n_acc, c(0.025, 0.5, 0.975))
# quantile(yp_n_acc$log_yp_n_acc, c(0.025, 0.5, 0.975))
# 
# # Sensitivity testing
# wts <- wts - sd(wts)
# yp_n_acc <- yp.n.acc(A, n, wts, n_iter)
# quantile(yp_n_acc$yp_n_acc, c(0.025, 0.5, 0.975))
# quantile(yp_n_acc$log_yp_n_acc, c(0.025, 0.5, 0.975))






