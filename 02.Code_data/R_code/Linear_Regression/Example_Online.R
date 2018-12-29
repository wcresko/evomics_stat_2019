##  An artificial example that creates the data, plots the data,
##  creates the linear model, creates a summary of the linear model,
##  and extracts the coefficients of the linear model.
##  A good way to create data is to use package mvtnorm.
##  sigma is a covariance matrix, not a correlation matrix.

library( package = mvtnorm )
sigma <- cbind( c( 0.6, 0.4 ), c( 0.4, 0.7 ) )
mat <- rmvnorm( n = 100, mean = c( 0, 0 ), sigma = sigma )
art <- data.frame( x = mat[ , 1 ], y = mat[ , 2 ] )
print(art)

get( getOption( "device" ) )()
plot(
  y ~ x,
  data = art,
  col  = "blue",
  xlim = c( -3, 3 ),
  ylim = c( -3, 3 ) )
art.lm <- lm( y ~ x, data = art )
# abline( art.lm, col = "red" )
art.summary <- summary( art.lm )
coef( art.summary )
art.summary[[ "r.squared" ]]

##  Show the prediction and confidence intervals.
##  See ?predict.lm for more information.

new.x.df =
  data.frame(
    x =
      seq(
        from   = range( art$x )[ 1 ],
        to     = range( art$x )[ 2 ],
        length = 11 ) )

lines(
  x   = new.x.df$x,
  y   = predict( art.lm, new.x.df, interval = "confidence" )[ , "upr" ],
  col = "green" )

lines(
  x   = new.x.df$x,
  y   = predict( art.lm, new.x.df, interval = "confidence" )[ , "lwr" ],
  col = "green" )

lines(
  x   = new.x.df$x,
  y   = predict( art.lm, new.x.df, interval = "confidence" )[ , "fit" ],
  col = "red" )

lines(
  x   = new.x.df$x,
  y   = predict( art.lm, new.x.df, interval = "prediction" )[ , "upr" ],
  col = "violet" )

lines(
  x   = new.x.df$x,
  y   = predict( art.lm, new.x.df, interval = "prediction" )[ , "lwr" ],
  col = "violet" )

##  Plot the residuals two ways, against the predicted values
##  (fitted values) and against the predictor variable(s).

get( getOption( "device" ) )()
plot( residuals( art.lm ) ~ fitted.values( art.lm ) )
get( getOption( "device" ) )()
plot( residuals( art.lm ) ~ art$x )