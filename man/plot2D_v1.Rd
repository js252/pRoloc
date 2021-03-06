\name{plot2D_v1}
\alias{plot2D_v1}
\title{Plot organelle assignment data and results.}
\usage{
plot2D_v1(object, fcol = "markers", fpch, unknown = "unknown", dims = 1:2,
  alpha, score = 1, outliers = TRUE, method = c("PCA", "MDS", "kpca"),
  methargs, axsSwitch = FALSE, mirrorX = FALSE, mirrorY = FALSE, col, pch,
  cex, index = FALSE, idx.cex = 0.75, identify = FALSE, plot = TRUE,
  ...)
}
\arguments{
  \item{object}{An instance of class \code{MSnSet}.}

  \item{fcol}{Feature meta-data label (fData column name)
  defining the groups to be differentiated using different
  colours. Default is \code{markers}. Use \code{NULL} to
  suppress any colouring.}

  \item{fpch}{Featre meta-data label (fData column name)
  desining the groups to be differentiated using different
  point symbols.}

  \item{unknown}{A \code{character} (default is
  \code{"unknown"}) defining how proteins of unknown
  localisation are labelled.}

  \item{dims}{A \code{numeric} of length 2 defining the
  dimensions to be plotted. Always 1:2 for MDS.}

  \item{alpha}{A numeric defining the alpha channel
  (transparency) of the points, where \code{0 <= alpha <=
  1}, 0 and 1 being completely transparent and opaque.}

  \item{score}{A numeric specifying the minimum organelle
  assignment score to consider features to be assigned an
  organelle. (not yet implemented).}

  \item{outliers}{A logical specifying whether outliers
  should be plotted or ignored (default is TRUE, i.e. all
  points are plotted). Useful when the presence of outliers
  masks the structure of the rest of the data. Outliers are
  defined by the 2.5 and 97.5 percentiles.}

  \item{method}{One of \code{PCA} (default), \code{MDS} or
  \code{kpca}, defining if dimensionality reduction is done
  using principal component analysis (see
  \code{\link{prcomp}}), classical multidimensional scaling
  (see \code{\link{cmdscale}}) or kernel PCA (see
  \code{kernlab::kpca}).}

  \item{methargs}{A \code{list} of arguments to be passed
  when \code{method} is called. If missing, the data will
  be scaled and centred prior to PCA.}

  \item{axsSwitch}{A \code{logical} indicating whether the
  axes should be switched.}

  \item{mirrorX}{A \code{logical} indicating whether the x
  axis should be mirrored?}

  \item{mirrorY}{A \code{logical} indicating whether the y
  axis should be mirrored?}

  \item{col}{A \code{character} of appropriate length
  defining colours.}

  \item{pch}{A \code{character} of appropriate length
  defining point character.}

  \item{cex}{Character expansion.}

  \item{index}{A \code{logical} (default is FALSE),
  indicating of the feature indices should be plotted on
  top of the symbols.}

  \item{idx.cex}{A \code{numeric} specifying the character
  expansion (default is 0.75) for the feature indices. Only
  relevant when \code{index} is TRUE.}

  \item{identify}{A logical (default is \code{TRUE})
  defining if user interaction will be expected to identify
  individual data points on the plot. See also
  \code{\link{identify}}.}

  \item{plot}{A \code{logical} defining if the figure
  should be plotted. Useful when retrieving data only.
  Default is \code{TRUE}.}

  \item{...}{Additional parameters passed to \code{plot}
  and \code{points}.}
}
\value{
Used for its side effects of generating a plot. Invisibly
returns the 2d data.
}
\description{
This is the documentation for the pre-v 1.3.6 function.
}
\details{
Generate 2 dimensional or feature distribution plots to
illustrate localistation clusters. In \code{plot2D_v1},
rows containing \code{NA} values are removed prior to
dimention reduction.
}
\examples{
library("pRolocdata")
data(dunkley2006)
pRoloc:::plot2D_v1(dunkley2006, fcol = NULL)
pRoloc:::plot2D_v1(dunkley2006, fcol = NULL, method = "kpca")
pRoloc:::plot2D_v1(dunkley2006, fcol = NULL, method = "kpca",
                   methargs = list(kpar = list(sigma = 1)))
pRoloc:::plot2D_v1(dunkley2006, fcol = "markers")
pRoloc:::addLegend_v1(dunkley2006,
                      fcol = "markers",
                      where = "topright",
                      cex = 0.5, bty = "n", ncol = 3)
title(main = "plot2D example")
}
\author{
Laurent Gatto <lg390@cam.ac.uk>
}
\seealso{
\code{\link{addLegend}} to add a legend to \code{plot2D_v1}
figures and \code{\link{plotDist}} for alternative
graphical representation of quantitative organelle
proteomics data.
}

