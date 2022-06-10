data {
    int N;
    vector[N] Miles;
    int deaths[N];
}

parameters {
    real<lower=0>theta;
}

model {
    theta ~ normal(0, 0.821);
    for (k in 1:N) {
        deaths[k] ~ poisson(Miles[k]*theta);
  }
}

generated quantities {
    real death[N];
    for (i in 1:N) {
        death[i] = poisson_rng(deaths[i]);
    }
}   