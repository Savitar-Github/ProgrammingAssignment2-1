# The function Calculates the inverse of the matrix and caches the ouput

# makeCacheMatrix function  makes a cache matrix to calculate the inverse on the matrix
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

# cacheSolve calculates the inverse of the matrix if the data is not present as the cache otherwise it returns the cached data
cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {c
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}