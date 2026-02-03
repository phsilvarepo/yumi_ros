module.exports = {
    // Use flows file from mounted volume
    flowFile: 'flows.json',
    
    // User directory - default /data in container
    userDir: '/data',
    
    // Node-RED UI settings
    uiPort: process.env.PORT || 1880,
    
    // Logging
    logging: {
        console: {
            level: "info",
            metrics: false,
            audit: false
        }
    },
    
    // Function node settings
    functionGlobalContext: {
        // Add any global context variables here
    },
    
    // Allow function nodes to load external modules
    functionExternalModules: true,
    
    // Export HTTP settings for dashboard
    httpNodeRoot: '/',
    httpAdminRoot: '/',
    
    // CORS settings for ROS communication
    httpNodeCors: {
        origin: "*",
        methods: "GET,PUT,POST,DELETE"
    }
}
