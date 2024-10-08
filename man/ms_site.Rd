% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ms_site.R
\docType{class}
\name{ms_site}
\alias{ms_site}
\title{Office 365 SharePoint site}
\format{
An R6 object of class \code{ms_site}, inheriting from \code{ms_object}.
}
\description{
Class representing a SharePoint site.
}
\section{Fields}{

\itemize{
\item \code{token}: The token used to authenticate with the Graph host.
\item \code{tenant}: The Azure Active Directory tenant for this site.
\item \code{type}: always "site" for a site object.
\item \code{properties}: The site properties.
}
}

\section{Methods}{

\itemize{
\item \code{new(...)}: Initialize a new site object. Do not call this directly; see 'Initialization' below.
\item \code{delete(confirm=TRUE)}: Delete a site. By default, ask for confirmation first.
\item \code{update(...)}: Update the site metadata in Microsoft Graph.
\item \code{do_operation(...)}: Carry out an arbitrary operation on the site.
\item \code{sync_fields()}: Synchronise the R object with the site metadata in Microsoft Graph.
\item \code{list_drives(filter=NULL, n=Inf)}: List the drives (shared document libraries) associated with this site.
\item \code{get_drive(drive_name, drive_id)}: Retrieve a shared document library for this site. If the name and ID are not specified, this returns the default document library.
\item \code{list_subsites(filter=NULL, n=Inf)}: List the subsites of this site.
\item \code{get_pages(type = c("sitePage", "page"))}: Returns SharePoint pages for this site.
\item \code{get_lists(filter=NULL, n=Inf)}: Returns the lists that are part of this site.
\item \code{get_list(list_name, list_id)}: Returns a specific list, either by name or ID.
\item \code{get_group()}: Retrieve the Microsoft 365 group associated with the site, if it exists. A site that backs a private Teams channel will not have a group associated with it.
}
}

\section{Initialization}{

Creating new objects of this class should be done via the \code{get_sharepoint_site} method of the \code{\link{ms_graph}} or \code{\link{az_group}} classes. Calling the \code{new()} method for this class only constructs the R object; it does not call the Microsoft Graph API to retrieve or create the actual site.
}

\section{List methods}{

All \verb{list_*} methods have \code{filter} and \code{n} arguments to limit the number of results. The former should be an \href{https://learn.microsoft.com/en-us/graph/query-parameters#filter-parameter}{OData expression} as a string to filter the result set on. The latter should be a number setting the maximum number of (filtered) results to return. The default values are \code{filter=NULL} and \code{n=Inf}. If \code{n=NULL}, the \code{ms_graph_pager} iterator object is returned instead to allow manual iteration over the results.

Support in the underlying Graph API for OData queries is patchy. Not all endpoints that return lists of objects support filtering, and if they do, they may not allow all of the defined operators. If your filtering expression results in an error, you can carry out the operation without filtering and then filter the results on the client side.
}

\examples{
\dontrun{

site <- get_sharepoint_site("My site")
site$list_drives()
site$get_drive()

}
}
\seealso{
\code{\link{ms_graph}}, \code{\link{ms_drive}}, \code{\link{az_user}}

\href{https://learn.microsoft.com/en-us/graph/overview}{Microsoft Graph overview},
\href{https://learn.microsoft.com/en-us/graph/api/resources/sharepoint?view=graph-rest-1.0}{SharePoint sites API reference}
}
