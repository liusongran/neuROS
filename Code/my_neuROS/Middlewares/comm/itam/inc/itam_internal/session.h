#include <uxr/client/core/session/session.h>

bool comm_itam_listen_message_reliably(
        uxrSession* session,
        int poll_ms);

bool comm_itam_run_session_until_data(
        uxrSession* session,
        int timeout_ms);

bool comm_itam_run_session_until_timeout(
        uxrSession* session,
        int timeout_ms);
