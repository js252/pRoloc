\name{getPredictions}
\alias{getPredictions}
\title{Returns the predictions in an 'MSnSet'}
\usage{
getPredictions(object, fcol, scol, t = 0, verbose = TRUE)
}
\arguments{
  \item{object}{An instance of class
  \code{"\linkS4class{MSnSet}"}.}

  \item{fcol}{The name of the prediction column in the
  \code{featureData} slot.}

  \item{scol}{The name of the prediction score column in
  the \code{featureData} slot. If missing, created by
  pasting '.scores' after \code{fcol}.}

  \item{t}{The score threshold. Predictions with score < t
  are set to 'unknown'. Default is 0. It is also possible
  to define thresholds for each prediction class, in which
  case, \code{t} is a named numeric with names exactly
  matching the unique prediction class names.}

  \item{verbose}{If \code{TRUE}, a prediction table is
  printed and the predictions are returned invisibly. If
  \code{FALSE}, the predictions are returned.}
}
\value{
A \code{character} of length \code{ncol(object)}.
}
\description{
Convenience accessor to the predicted feature localisation
in an 'MSnSet'. This function returns the predictions of an
\code{MSnSet} instance. As a side effect, it prints out a
prediction table.
}
\examples{
library("pRolocdata")
data(dunkley2006)
res <- svmClassification(dunkley2006, fcol = "pd.markers",
                         sigma = 0.1, cost = 0.5)
fData(res)$svm[500:510]
fData(res)$svm.scores[500:510]
getPredictions(res, fcol = "svm", t = 0) ## all predictions
getPredictions(res, fcol = "svm", t = .9) ## single threshold
## 50\% top predictions per class
(ts <- tapply(fData(res)$svm.scores, fData(res)$svm, median))
getPredictions(res, fcol = "svm", t = ts)
## 50\% top predictions per class, ignoring marker scores
ts <- tapply(fData(res)$svm.scores, fData(res)$svm,
             function(x) {
                 scr <- median(x[x != 1])
                 ifelse(is.na(scr), 1, scr)
             })
ts
getPredictions(res, fcol = "svm", t = ts)
}
\author{
Laurent Gatto
}

