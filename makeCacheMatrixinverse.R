##Assignment: Caching the Inverse of a Matrix

#Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than computing it repeatedly (there are also alternatives to matrix inversion that we will not discuss here). Your assignment is to write a pair of functions that cache the inverse of a matrix.

#Write the following functions:
  
#makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
#cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.
#Computing the inverse of a square matrix can be done with the solve function in R. For example, if X is a square invertible matrix, then solve(X) returns its inverse.

#For this assignment, assume that the matrix supplied is always invertible.

#In order to complete this assignment, you must do the following:
  
  # Fork the GitHub repository containing the stub R files at https://github.com/rdpeng/ProgrammingAssignment2 to create a copy under your own account.
  #Clone your forked GitHub repository to your computer so that you can edit the files locally on your own machine.
  #Edit the R file contained in the git repository and place your solution in that file (please do not rename the file).
  #Commit your completed R file into YOUR git repository and push your git branch to the GitHub repository under your account.
  #Submit to Coursera the URL to your GitHub repository that contains the completed R code for the assignment.



makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmatrixnverse <- function(inverse) m <<- inverse
  getmatrixnverse <- function() m
  list(set = set, get = get,
       setmatrixnverse = setmatrixnverse,
       getmatrixnverse = getmatrixnverse)
}

cachematrixinverse <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  xsetmatrixnverse(m)
  m
}