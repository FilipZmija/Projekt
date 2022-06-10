data {
  int M;
  vector[M] miles;
  int y[M];
}
parameters {
  real<lower=0>theta;
}
model {
  theta ~ normal(0, 0.479);
  for (k in 1:M) {
    y[k] ~ poisson(miles[k] * theta);
  }
}
generated quantities {
  int y_sim[M];
  for (k in 1:M) {
    y_sim[k] = poisson_rng(miles[k] * theta);
  }
}