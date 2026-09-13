cmake_minimum_required(VERSION 3.31)

project(Steamworks VERSION 1.65.0 LANGUAGES C)

include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

set(STEAMWORKS_SDK_DIR "${CMAKE_CURRENT_SOURCE_DIR}/sdk")
set(STEAMWORKS_LIBRARY "${STEAMWORKS_SDK_DIR}/redistributable_bin/linux64/libsteam_api.so")
set(STEAMWORKS_INCLUDE_DIR "${STEAMWORKS_SDK_DIR}/public")

# Build/install interface target
# ---------------------------------------------------------------------------
add_library(Steamworks INTERFACE)

add_library(Steamworks::Steamworks ALIAS Steamworks)

target_include_directories(
    Steamworks INTERFACE
        "$<BUILD_INTERFACE:${STEAMWORKS_INCLUDE_DIR}>"
        "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
)
# ---------------------------------------------------------------------------

# Install headers
# ---------------------------------------------------------------------------
install(
    DIRECTORY "${STEAMWORKS_INCLUDE_DIR}/steam"
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)
# ---------------------------------------------------------------------------

# Install library
# ---------------------------------------------------------------------------
install(
    FILES "${STEAMWORKS_LIBRARY}"
    DESTINATION "${CMAKE_INSTALL_LIBDIR}"
)
# ---------------------------------------------------------------------------

# Export target
# ---------------------------------------------------------------------------
install(
    TARGETS Steamworks
    EXPORT SteamworksTargets
)

install(
    EXPORT SteamworksTargets
    FILE SteamworksTargets.cmake
    NAMESPACE Steamworks::
    DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/Steamworks"
)
# ---------------------------------------------------------------------------

# Package config
# ---------------------------------------------------------------------------
configure_package_config_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake/SteamworksConfig.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/SteamworksConfig.cmake"
    INSTALL_DESTINATION
        "${CMAKE_INSTALL_LIBDIR}/cmake/Steamworks"
)

write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/SteamworksConfigVersion.cmake"
    VERSION "${PROJECT_VERSION}"
    COMPATIBILITY SameMajorVersion
)

install(
    FILES
        "${CMAKE_CURRENT_BINARY_DIR}/SteamworksConfig.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/SteamworksConfigVersion.cmake"
    DESTINATION
        "${CMAKE_INSTALL_LIBDIR}/cmake/Steamworks"
)
# ---------------------------------------------------------------------------
