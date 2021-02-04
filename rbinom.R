
# https://www.gastonsanchez.com/packyourcode/intro.html
#coin toss example

num_flips <- 10

coin <- c('head', 'tail') # head 1, tail 0, or success 1, failure 0
flips <- list(sample(coin, size = num_flips, replace = TRUE))
flips



# if we see head as success, we will replace with 1
#
num_flips <- 10
coin_success <- c(1,0) # head 1, tail 0, or success 1, failure 0
flips <- list(sample(coin_success, size = num_flips, replace = TRUE))
flips
flip_list <- list()
for (i in seq(20)) {
    flipToAdd <- list(sample(coin_success, size = num_flips, replace = T))
    flip_list <- append(flip_list, values = flipToAdd, after = length(i))
    
}

flip_list <- list()
for (i in seq(1000)) {
    flipToAdd <- list(sample(coin_success, size = num_flips,prob = c(0.8,0.2), replace = T))
    flip_list <- append(flip_list, values = flipToAdd, after = length(i))
    
}

sum_success <- lapply(flip_list, sum)
sum_success <- unlist(sum_success)
hist(sum_success)


# binomial dist
x1 <- rbinom(1000,size = 10, p=.5)

x2 = rbinom(1000, size=10, p=.85)
# https://m-clark.github.io/bayesian-basics/example.html

shots <-  c('goal','goal','goal','miss','miss',
          'goal','goal','miss','miss','goal')
shotsNum <- as.numeric(shots=='goal')
N <- length(shots)
nGoal <- sum(shots=='goal')
nMiss <- sum(shots=='miss')
N <- 10
theta = seq(from=1/(N+1), to=N/(N+1), length=10)

#prior
pTheta = pmin(theta, 1-theta)
hist(pTheta)
pTheta = pTheta/sum(pTheta) 
# # uniform
#  pTheta = dunif(theta)
#  hist(pTheta)
#  # beta prior with mean = .5
# pTheta = dbeta(theta, 10, 10)
# hist(pTheta)

pDataGivenTheta = choose(N, nGoal) * theta^nGoal * (1-theta)^nMiss

# dbinom(x,size,prob)
# dbinom(x= number of success(k), size= number of trial(N), prob=probability(theta))
# dbinom = choose(N,k) *