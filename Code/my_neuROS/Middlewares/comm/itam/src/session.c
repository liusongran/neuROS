
#include <itam_internal/session.h>

bool comm_itam_listen_message_reliably(
        uxrSession* session,
        int poll_ms)
{
    bool received = false;
    int32_t poll = (poll_ms >= 0) ? poll_ms : INT32_MAX;
    task_delay(poll);//TODO: freertos API

    //TODO: check data sign??

    return received;
}

bool comm_itam_run_session_until_data(
        uxrSession* session,
        int timeout_ms)
{
    UXR_LOCK_SESSION(session);      //??
    {
        int64_t start_timestamp = uxr_millis();
        int remaining_time = timeout_ms;

        session->on_data_flag = false;
        do {
            comm_itam_listen_message_reliably(session, remaining_time);
            if (session->on_data_flag) {
                break;
            }
            remaining_time = timeout_ms - (int)(uxr_millis() - start_timestamp);
        } while (remaining_time > 0);
        bool ret = session->on_data_flag;
    }
    UXR_UNLOCK_SESSION(session);    //??
    return ret;
}

bool comm_itam_run_session_until_timeout(
        uxrSession* session,
        int timeout_ms)
{
    UXR_LOCK_SESSION(session);      //??
    {
        bool ret = comm_itam_listen_message_reliably(session, timeout_ms);
    }
    UXR_UNLOCK_SESSION(session);    //??
    return ret;
}
