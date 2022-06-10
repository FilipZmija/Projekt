data {
  int M;
  int y[M];
  int sigma;
}
parameters {
  real<lower=0>lambda;
}
model {
  lambda ~ normal(0,sigma);
  for (k in 1:M) {
    y[k] ~ poisson(lambda);
  }
}
generated quantities {
  int y_sim[M];
  vector[M] log_lik;
  for (k in 1:M) {
    y_sim[k] = poisson_rng(lambda);
    log_lik[k] = poisson_log_lpmf(y_sim[k] | log(y[k]));
  }
}