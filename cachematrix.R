## Functions can be tested with an inversible matrix, like: matrix(c(4,3,3,2),2,2)

## makeCachematrix function stores the matrix and it's inverse (if calculated). Getters and setters for matrix and inverse are exposed

makeCacheMatrix <- function(x = matrix()) {
  inverse=NULL
  set <- function(y){ ##Setting the matrix
    x <<- y
    inverse <<- NULL
  }
  get <- function(){ ##getting the matrix
    x 
  }
  getInverse <- function(){ ##get the inverse
    inverse
  }
  setInverse <- function(newinverse){ ##set the inverse
    inverse <<- newinverse
  }
  list(set=set,get=get,getInverse=getInverse,setInverse=setInverse) ##expose functions as a list
}


## Cachesolve prints out the inverse, either from cache or by calculating (and setting cache)

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getInverse() ##try to get inverse from cache
  if (is.null(inverse)){
    message("No inverse in cache. Calculating...")
    inverse <- solve(x$get()) ##calculate inverse 
    x$setInverse(inverse) ##set inverse to cache
  }
  inverse ##return inverse
}
