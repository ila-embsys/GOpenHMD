vala_unit_test_files = [
    'openhmd-info',
    'gopenhmd-probe',
    'gopenhmd-device-descriptions',
    'gopenhmd-device',
    'gopenhmd-pose',
]

js_unit_test_files = [
    'gopenhmd-probe',
    'gopenhmd-list-gets',
    'gopenhmd-gets-description',
    'gopenhmd-device-descriptions',
    'gopenhmd-device',
    'gopenhmd-pose',
]


foreach name : vala_unit_test_files
    test(
        'vala-' + name,
        executable(
            'vala-' + name,
            name + '-test.vala', sources,
            dependencies: gopenhmd_dep,
        ),
        env: ['G_MESSAGES_DEBUG=all'],
    )
endforeach

gjs = find_program('gjs', required: false)
gjs_envs = [
    'G_MESSAGES_DEBUG=all',
    'GI_TYPELIB_PATH=' + meson.project_build_root(),
    'LD_LIBRARY_PATH=' + meson.project_build_root(),
]

if not gjs.found()
    message('gjs not found. gjs tests would not be configured')
else
    foreach name : js_unit_test_files
        test('js-' + name, gjs,
            env: gjs_envs,
            args: [ meson.current_source_dir() / name + '-test.js' ],
        )
    endforeach
endif
