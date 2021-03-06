\name{markerSet}
\alias{markerSet}
\alias{unknownSet}
\title{Extract marker subset}
\usage{
markerSet(object, fcol = "markers")

unknownSet(object, fcol = "markers")
}
\arguments{
  \item{object}{An instance of class \code{MSnSet}}

  \item{fcol}{The name of the feature data column, that
  will be used to separate the markers from the proteins of
  unknown localisation (with \code{fData(object)[, fcol] ==
  "unknown")}). Default is to use \code{"markers"}.}
}
\value{
An new \code{MSnSet} with marker/unknown proteins only.
}
\description{
This function extracts the marker proteins into a new
\code{MSnSet}.
}
\examples{
library("pRolocdata")
data(dunkley2006)
mrk <- markerSet(dunkley2006)
unk <- unknownSet(dunkley2006)
dim(dunkley2006)
dim(mrk)
dim(unk)
table(fData(dunkley2006)$markers)
table(fData(mrk)$markers)
table(fData(unk)$markers)
}
\author{
Laurent Gatto
}

