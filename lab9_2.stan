
// The input data is a vector 'y' of length 'N'.
data {
  int<lower=0> N; // number of regions
  int y[N]; // deaths
  vector[N] log_e; // log of expected deaths
  vector[N] x; // proportion of outsides workers
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  vector[N] alpha;
  real beta;
}

transformed parameters{
  vector[N] log_theta;
  
  log_theta = alpha + beta*x;
}

model {
  y ~ poisson_log(log_theta+log_e);
  alpha ~ normal(0,1);
  beta ~ normal(0,1);
}


