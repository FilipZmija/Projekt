data {
    int N;
    vector[N] Miles;
    real deaths[N];
}

parameters {
    real alpha;
    real beta;
    real<lower=0> sigma;
}

transformed parameters {
   vector[N] mu = Miles*beta+alpha;
}

model {
   alpha ~ normal(33000,6000);
   beta ~ lognormal(0,1);
   sigma ~ exponential(0.08);
   deaths ~ normal(mu,sigma);
}

generated quantities {
    real death[N];
    vector[N] log_lik;
    for (i in 1:N) {
        death[i] = normal_rng(mu[i], sigma);
        log_lik[i] = normal_lpdf(death[i] | mu[i], sigma);
    }
}   