local TEESHandler = {
    VERSION  = "1.0.0",
    PRIORITY = 1,
}

function TEESHandler:init_worker()
    kong.log.debug("Started TEESHandler")
end
