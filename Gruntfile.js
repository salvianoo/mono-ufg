module.exports = function(grunt) {
    grunt.initConfig({
        watch: {
            options: {
                spawn: false
            },
            app :{
                files: ['monografia.tex'],
                tasks: ['latex']
            }
        },
        latex: {
            pdf: {
                src: ['monografia.tex'],
                options: {
                    outputDirectory: 'tmp'
                }
            },
            // bib: {
            //     src: ['tmp/monografia.aux'],
            //     options: {
            //         engine: 'bibtex',
            //         interaction: false
            //     }
            // }
        },
        shell: {
            makeIndex: {
                command: 'makeindex tmp/monografia.nlo -s nomencl.ist -o tmp/monografia.nls'
            },
            bibTex: {
                command: 'bibtex tmp/monografia.aux'
            }
        },
        clean: {
            tests: ['tmp'],
        }
    });

    grunt.loadNpmTasks('grunt-latex')
    grunt.loadNpmTasks('grunt-contrib-watch')
    grunt.loadNpmTasks('grunt-shell')
    grunt.loadNpmTasks('grunt-contrib-clean')

    grunt.registerTask('watch', ['watch'])
    grunt.registerTask('default', ['latex', 'shell:bibTex', 'latex', 'latex'])

}

