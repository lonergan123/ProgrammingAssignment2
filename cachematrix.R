## This file contains 2 functions, one to set/get the value of a matrix and its inverse
## The other function returns the matrix inverse from the cache if available, or calculates and caches it if not

## makeCacheMatrix takes a matrix argument and returns a list of 4 functions:
## get() returns the matrix; setinverse() caches the inverse of the matrix; 
## getinverse() returns the inverted matrix; and set() sets the value of the matrix

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
set <- function(y) {
        x <<- y
        i <<- NULL
        }
get <- function() x
setinverse <- function(inverse) i <<- inverse
getinverse <- function() i
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## cacheSolve is a function that takes a special matrix as an argument and then returns
## either the cached inverse (if available), or calculates the inverse and stores the cache for future access

cacheSolve <- function(x, ...) {
        i <- x$getinverse()
if(!is.null(i)) {
        message("getting cached data")
        return(i)
        }
data <- x$get()
i <- solve(data)
x$setinverse(i)
i
}