library(knitr)
library(tidyverse)

#curl_easy_setopt(curl, CURLOPT_CONNECTTIMEOUT, 25L)

numbers <- 1:413

for(i in numbers){
  
  NumberParam <- i
  
  rmarkdown::render("reprex_report.Rmd",
                    output_dir = "sample_reports",
                    output_file = paste0(Sys.Date(),
                                         "_invoicing-report-number-",
                                         NumberParam,
                                         ".html"),
                    params = list(number = NumberParam))
  
  pagedown::chrome_print(input = paste0("sample_reports/",
                                        Sys.Date(),
                                        "_invoicing-report-number-",
                                        NumberParam,
                                        ".html"),
                         output = paste0("sample_reports/",
                                         Sys.Date(),
                                         "_invoicing-report-number-",
                                         NumberParam,
                                         ".pdf"),
                         timeout = 600)
  
}
