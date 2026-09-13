cmake_minimum_required(VERSION 3.31)

project(steamworks C)
include(GNUInstallDirs)

install(
    DIRECTORY "sdk/public/steam"
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/steamworks"
)
install(
    FILES "sdk/redistributable_bin/linux64/libsteam_api.so"
    DESTINATION "${CMAKE_INSTALL_LIBDIR}"
)

install(
    FILES "steamworksConfig.cmake"
    DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/steamworks"
)
