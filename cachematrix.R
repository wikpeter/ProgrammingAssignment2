## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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


## Write a short comment describing this function

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
