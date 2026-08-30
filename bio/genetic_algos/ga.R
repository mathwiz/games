# setwd('Github/games/bio/genetic_algo')
population <- matrix(1:320, nrow=10, ncol=32)

pop <- list()

pop[[1]] <- rep(0, 10)

for (i in 1:10) { pop[[i]] <- rep(0, 16) }

nums <- 1:10
nums2 <- numeric(length(nums))

for (i in seq_along(nums)) { nums2[i] <- sqrt(nums[i]) }

