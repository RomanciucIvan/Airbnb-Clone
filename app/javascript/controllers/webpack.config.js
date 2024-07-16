const path = require('path');

module.exports = {
    entry: './src/index.js', // Путь к вашему основному файлу
    output: {
        path: path.resolve(__dirname, 'dist'), // Путь к директории для сборки
        filename: 'bundle.js' // Имя выходного файла
    },
    // Другие настройки webpack
};
