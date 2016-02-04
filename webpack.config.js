module.exports = {
    entry: './app/main.js',
    output: {
        path: './build',
        publicPath: '/build/',
        filename: 'bundle.js'
    },
    devServer: {
        inline: true,
        port: 3333
    },
    devtool: 'source-map',
    module: {
        loaders: [{
            test: /\.js$/,
            exclude: /node_modules/,
            loader: 'babel',
            query: {
                presets: ['es2015', 'react']
            }
        }]
    }
};
