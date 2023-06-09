local typedefs = require "kong.db.schema.typedefs"


return {
    name = "tees",
    fields = {
        {
            -- this plugin will only be applied to Services or Routes
            consumer = typedefs.no_consumer
        },
        {
            -- this plugin will only run within Nginx HTTP module
            protocols = typedefs.protocols_http
        },
        {
            config = {
                type = "record",
                fields = {
                    {
                        server = {
                            type = "record",
                            fields = {
                                protocol = typedefs.protocol {
                                    default = "http"
                                },

                                host = typedefs.host {
                                    default = "localhost"
                                },

                                port = {
                                    type = "number",
                                    default = 8080,
                                    between = { 0, 65534 },
                                },

                                connection = {
                                    type = "record",
                                    fields = {
                                        {
                                            timeout = {
                                                type = "number",
                                                default = 60,
                                            },
                                        },
                                        {
                                            pool = {
                                                type = "number",
                                                default = 10,
                                            },
                                        },
                                    },
                                },
                            }
                        }
                    },
                },
            },
        },
    },
}