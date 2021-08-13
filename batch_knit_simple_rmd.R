numbers <- 1:413

for(i in numbers){
  
  rmarkdown::render("./simple_rmd.Rmd",
                    output_dir = "./sample_reports",
                    output_file = paste0(Sys.Date(),
                                         "_invoicing-report-number-",
                                         i,
                                         ".html"))
  
  pagedown::chrome_print(input = paste0("./sample_reports/",
                                        Sys.Date(),
                                        "_invoicing-report-number-",
                                        i,
                                        ".html"),
                         output = paste0("./sample_reports/",
                                         Sys.Date(),
                                         "_invoicing-report-number-",
                                         i,
                                         ".pdf"),
                         timeout = 600)
  
}