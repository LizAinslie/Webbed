qt5_add_resources(webbed_SRCS resources.qrc)
add_executable(webbed main.cpp ${webbed_SRCS})
target_link_libraries(webbed Qt5::Core Qt5::Gui Qt5::Qml Qt5::Quick Qt5::QuickControls2 Qt5::Svg KF5::I18n)
install(TARGETS webbed ${KF5_INSTALL_TARGETS_DEFAULT_ARGS})
