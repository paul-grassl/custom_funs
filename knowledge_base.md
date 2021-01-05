<!-- knowledge_base.md is generated from knowledge_base.Rmd. Please edit that file -->

## How to set priors:

### For Gaussian models:

### For Binomial models (logit link):

As an example we choose the prosocial chimpanzees experiment from
McElreath (Chapter Binomial regression p. 333). They sit in front of a
table with two levers (left, right) and across the table sits either
another chimpanzee or no one. One of the levers gives both chimanzees
food, the other one only the chimpanzee that makes the decision/pulls
the lever. The dependent variable is `pulled_left` (coding: left = 1,
right = 0) with `prosocial_left` (coding: prosocial on the left = 1) and
`condition` (featuring another chimpanzee on the other side = 1) as
independent variables.

#### Intercept \(\alpha\):

We want a prior for the intercept of `pulled_left` so what is the
general probability of a chimpanzee pulling either lever. If we use a
\(Normal(0, 10)\) prior the probability is only on 0 and 1, so the model
thinks that chimpanzees either never or always pull the the left lever.
Better is something that distributes the probability more in the middle
like \(Normal(0, 1)\). We have to take into account that a normal
distribution becomes logit-normal because of the logit link function in
binomial regression. Let’s plot prior predictive checks:

``` r
# I'm using the logitnorm package here because there is no standard implementation of a logit-normal distribution in R
# x is the probability of pulling left/right (left = 1)
# y is the density
ggplot2::ggplot(data.frame(x = c(0:1)), aes = (x = x)) + 
  stat_function(fun = logitnorm::dlogitnorm, args = list(mu = 0, sigma = 1), colour = 'red') +
  stat_function(fun = logitnorm::dlogitnorm, args = list(mu = 0, sigma = 10), colour = 'black') +
  scale_x_continuous(limits = c(0,1)) +
  labs(x = "Prior Probability Pulling Left/Right", y = "Density")
```

<img src="figures/unnamed-chunk-2-1.png" width="60%" style="display: block; margin: auto;" />

### For Poisson models (log link):

Let’s say you have a count of how many fish was fished in a lake per
day. So there is no upper boundary (hence we use Poisson)

#### Intercept \(\alpha\):

Before seeing the data we expect that people fish mostly between 10 and
40 fish per day but also numbers like 100 can happen. Since Poisson uses
a log link function a normal prior becomes log-normal. To know what a
normal mean and standard deviation translate to on the log-normal scale
we can use the following formula to calculate the log-normal mean:

``` r
exp(mean + sd^2/2)
```

A normal prior like \(Normal(0, 10)\) becomes `exp(50)`as mean which is
complete nonsense (super huge number). For our example something like
\(Normal(3, 1)\) would be better. Now the mean is around 33 fish. To
plot different mean and sd combinations (on log-normal scale) use:

``` r
# y just the prob density
ggplot2::ggplot(data.frame(x = c(0:200)), aes = (x = x)) + 
  stat_function(fun = dlnorm, args = list(meanlog = 3, sdlog = 1)) +
  scale_x_continuous(limits = c(0,200)) +
  labs(x = "Number of fish", y = "Probability density")
```

<img src="figures/unnamed-chunk-4-1.png" width="60%" style="display: block; margin: auto;" />

#### Predictor coefficient \(\beta\):