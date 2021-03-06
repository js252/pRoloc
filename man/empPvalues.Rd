\name{empPvalues}

\alias{empPvalues}

\title{
  Estimate empirical p-values for \eqn{Chi^2} protein correlations.
}

\description{
  Andersen et al. (2003) used a fixed \eqn{Chi^2} threshold of 0.05 to
  identify organelle-specific candidates. This function computes
  empirical p-values by permutation the markers relative intensities and
  computed null \eqn{Chi^2} values.  
}

\usage{
empPvalues(marker, corMatrix, n = 100, ...)
}


\arguments{
  \item{marker}{
    A \code{numerics} with markers relative intensities.
  }
  \item{corMatrix}{
    A \code{matrix} of \code{nrow(corMatrix)} protein relative
    intensities to be compares against the marker. 
  }
  \item{n}{
    The number of iterations.
}
  \item{\dots}{
    Additional parameters to be passed to \code{chi2}.
  }
}


\value{
  A \code{numeric} of length \code{nrow(corMatrix)}.
}

\author{
  Laurent Gatto <lg390@cam.ac.uk>
}


\seealso{
  \code{\link{chi2}} for \eqn{Chi^2} calculation.
}

\examples{
set.seed(1)
mrk <- rnorm(6, 5, 1)
prot <- rbind(matrix(rnorm(120, 5, 1), ncol = 6),
              mrk + rnorm(6))
mrk <- mrk/sum(mrk)
prot <- prot/rowSums(prot)
empPvalues(mrk, prot)
}

\references{
  Andersen, J. S., Wilkinson, C. J., Mayor, T., Mortensen, P. et al.,
  Proteomic characterization of the human centrosome by protein
  correlation profiling. Nature 2003, 426, 570 - 574.
}