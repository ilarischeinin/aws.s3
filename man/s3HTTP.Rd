% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/s3HTTP.R
\name{s3HTTP}
\alias{s3HTTP}
\title{S3 HTTP Requests}
\usage{
s3HTTP(
  verb = "GET",
  bucket = "",
  path = "",
  query = NULL,
  headers = list(),
  request_body = "",
  write_disk = NULL,
  write_fn = NULL,
  accelerate = FALSE,
  dualstack = FALSE,
  parse_response = TRUE,
  check_region = FALSE,
  url_style = c("path", "virtual"),
  base_url = Sys.getenv("AWS_S3_ENDPOINT", "s3.amazonaws.com"),
  verbose = getOption("verbose", FALSE),
  show_progress = getOption("verbose", FALSE),
  region = NULL,
  key = NULL,
  secret = NULL,
  session_token = NULL,
  use_https = TRUE,
  ...
)
}
\arguments{
\item{verb}{A character string containing an HTTP verb, defaulting to \dQuote{GET}.}

\item{bucket}{A character string with the name of the bucket, or an object of class \dQuote{s3_bucket}. If the latter and a region can be inferred from the bucket object attributes, then that region is used instead of \code{region}.}

\item{path}{A character string with the name of the object to put in the bucket (sometimes called the object or 'key name' in the AWS documentation.)}

\item{query}{Any query arguments, passed as a named list of key-value pairs.}

\item{headers}{A list of request headers for the REST call.}

\item{request_body}{A character string containing request body data.}

\item{write_disk}{If \code{verb = "GET"}, this is, optionally, an argument like \code{\link[httr]{write_disk}} to write the result directly to disk.}

\item{write_fn}{If set to a function and \code{verb = "GET"} is used then the output is passed in chunks as a raw vector in the first argument to this function, allowing streaming output. Note that \code{write_disk} and \code{write_fn} are mutually exclusive.}

\item{accelerate}{A logical indicating whether to use AWS transfer acceleration, which can produce significant speed improvements for cross-country transfers. Acceleration only works with buckets that do not have dots in bucket name.}

\item{dualstack}{A logical indicating whether to use \dQuote{dual stack} requests, which can resolve to either IPv4 or IPv6. See \url{http://docs.aws.amazon.com/AmazonS3/latest/dev/dual-stack-endpoints.html}.}

\item{parse_response}{A logical indicating whether to return the response as is, or parse and return as a list. Default is \code{TRUE}.}

\item{check_region}{A logical indicating whether to check the value of \code{region} against the apparent bucket region. This is useful for avoiding (often confusing) out-of-region errors. Default is \code{FALSE}.}

\item{url_style}{A character string specifying either \dQuote{path} (the default), or \dQuote{virtual}-style S3 URLs.}

\item{base_url}{A character string specifying the base hostname for the request (it is a misnomer, the actual URL is constructed from this name, region and \code{use_https} flag. There is no need to set this, as it is provided only to generalize the package to (potentially) support S3-compatible storage on non-AWS servers. The easiest way to use S3-compatible storage is to set the \env{AWS_S3_ENDPOINT} environment variable. When using non-AWS servers, you may also want to set \code{region=""}.}

\item{verbose}{A logical indicating whether to be verbose. Default is given by \code{options("verbose")}.}

\item{show_progress}{A logical indicating whether to show a progress bar for downloads and uploads. Default is given by \code{options("verbose")}.}

\item{region}{A character string containing the AWS region. Ignored if region can be inferred from \code{bucket}. If missing, an attempt is made to locate it from credentials. Defaults to \dQuote{us-east-1} if all else fails. Should be set to \code{""} when using non-AWS endpoints that don't include regions (and \code{base_url} must be set).}

\item{key}{A character string containing an AWS Access Key ID. If missing, defaults to value stored in environment variable \env{AWS_ACCESS_KEY_ID}.}

\item{secret}{A character string containing an AWS Secret Access Key. If missing, defaults to value stored in environment variable \env{AWS_SECRET_ACCESS_KEY}.}

\item{session_token}{Optionally, a character string containing an AWS temporary Session Token. If missing, defaults to value stored in environment variable \env{AWS_SESSION_TOKEN}.}

\item{use_https}{Optionally, a logical indicating whether to use HTTPS requests. Default is \code{TRUE}.}

\item{...}{Additional arguments passed to an HTTP request function. such as \code{\link[httr]{GET}}.}
}
\value{
the S3 response, or the relevant error.
}
\description{
This is the workhorse function for executing API requests for S3.
}
\details{
This is mostly an internal function for executing API requests. In almost all cases, users do not need to access this directly.
}
