set(WEBWORKER_SOURCE_DIR ${SERENITY_SOURCE_DIR}/Userland/Services/WebWorker)

set(WEBWORKER_SOURCES
    "${WEBWORKER_SOURCE_DIR}/ConnectionFromClient.cpp"
    "${WEBWORKER_SOURCE_DIR}/DedicatedWorkerHost.cpp"
    "${WEBWORKER_SOURCE_DIR}/PageHost.cpp"
    ../HelperProcess.cpp
    ../Utilities.cpp
)

add_library(webworker STATIC ${WEBWORKER_SOURCES})
set_target_properties(webworker PROPERTIES AUTOMOC OFF AUTORCC OFF AUTOUIC OFF)

target_include_directories(webworker PRIVATE ${SERENITY_SOURCE_DIR}/Userland/Services/)
target_include_directories(webworker PRIVATE ${SERENITY_SOURCE_DIR}/Userland/)
target_include_directories(webworker PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/..)
target_link_libraries(webworker PUBLIC LibCore LibFileSystem LibGfx LibIPC LibJS LibProtocol LibWeb LibWebView LibLocale LibImageDecoderClient LibMain LibSQL LibURL)

if (ENABLE_QT)
    qt_add_executable(WebWorker
            ../Qt/EventLoopImplementationQt.cpp
            ../Qt/EventLoopImplementationQtEventTarget.cpp
            ../Qt/RequestManagerQt.cpp
            ../Qt/StringUtils.cpp
            ../Qt/WebSocketQt.cpp
            ../Qt/WebSocketImplQt.cpp
            main.cpp
    )
    target_link_libraries(WebWorker PRIVATE Qt::Core Qt::Network)
    target_link_libraries(WebWorker PRIVATE webworker LibWebSocket)
    target_compile_definitions(WebWorker PRIVATE HAVE_QT=1)

else()
    add_executable(WebWorker main.cpp)
endif()

target_include_directories(WebWorker PRIVATE ${SERENITY_SOURCE_DIR}/Userland/)
target_link_libraries(WebWorker PRIVATE webworker)
