d <- data.frame(x=c(1,4,5,7), y=c(0.8,4.2,4.7,8))
##Fit the model
lm1 <- lm(y~x,data=d)

## create the new variables through prediction
p_conf1 <- predict(lm1,interval="confidence", level = 0.99)
p_pred1 <- predict(lm1,interval="prediction", level = 0.99)
print(p_conf1)
print(p_pred1)

## Conf. and pred. intervals with new x values 
## (extrapolation and more finely/evenly spaced than original data):
nd <- data.frame(x=seq(0,8,length=51))
p_conf2 <- predict(lm1,interval="confidence", newdata=nd, level = 0.99)
p_pred2 <- predict(lm1,interval="prediction", newdata=nd, level = 0.99)
print(p_conf2)
print(p_pred2)

## plot everything together
plot(y~x,data=d,ylim=c(-5,12),xlim=c(0,8)) ## data
abline(lm1) ## fit
matlines(d$x,p_conf1[,c("lwr","upr")],col=2,lty=1,type="b",pch="+")
matlines(d$x,p_pred1[,c("lwr","upr")],col=2,lty=2,type="b",pch=1)
matlines(nd$x,p_conf2[,c("lwr","upr")],col=4,lty=1,type="b",pch="+")
matlines(nd$x,p_pred2[,c("lwr","upr")],col=4,lty=2,type="b",pch=1)