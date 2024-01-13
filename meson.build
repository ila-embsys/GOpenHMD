project('GOpenHMD', 'vala')

vapi_dir = meson.current_source_dir() / 'openhmd-bindings'


add_project_arguments(['--vapidir', vapi_dir], language: 'vala')

gopenhmd_dep = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('openhmd'),
]

sources = files(
    'src/gopenhmd.vala',
    'src/context.vala',
    'src/device_description.vala',
    'src/device_settings.vala',
    'src/device.vala',
    'src/interfaces.vala',
)

subdir('tests')

gopenhmd_lib = shared_library('gopenhmd',
                vala_gir: 'GOpenHMD-1.0.gir',
                dependencies: gopenhmd_dep,
                sources: sources,
                install: true,
                install_dir: [true, true, true, true])

pkg = import('pkgconfig')
pkg.generate(gopenhmd_lib)

g_ir_compiler = find_program('g-ir-compiler')

custom_target('gopenhmd typelib', command: [
                g_ir_compiler,
                '--shared-library=libgopenhmd',
                '--output', '@OUTPUT@', '@INPUT@'
            ],
            input: meson.current_build_dir() / 'GOpenHMD-1.0.gir',
            output: 'GOpenHMD-1.0.typelib',
            depends: gopenhmd_lib,
            install: false,
            install_dir: get_option('libdir') / 'girepository-1.0')
