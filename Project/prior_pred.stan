data {
  int M;
  int sigma;
}

generated quantities {
  real lambda=fabs(normal_rng(0,sigma));
  int y_sim[M];
  for (k in 1:M) {
    y_sim[k] = poisson_rng(lambda);
  }
}