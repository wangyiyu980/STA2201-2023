
data {
  int<lower=0> N; //number of regions
  int y[N]; //death
  vector[N] log_e; //log of expected deaths
  vector[N] x; //proportion of outside workers
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  real alpha;
  real beta;

}
transformed parameters{
  vector[N] log_theta;
  log_theta = alpha+beta*x;
}

model {
  y ~ poisson_log(log_theta+log_e);
  alpha ~ normal(0,1);
  beta ~ normal(0,1);
}

