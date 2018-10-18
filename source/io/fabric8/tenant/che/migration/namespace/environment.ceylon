

shared object environment {
    function get(String name) =>
            if (exists var=process.environmentVariableValue(name),
                ! var.empty) then var else null;

    shared String? maintenance = get("MAINTENANCE");
    shared String? requestId = get("REQUEST_ID");
    shared String? identityId = get("IDENTITY_ID");
    shared String? jobRequestId = get("JOB_REQUEST_ID");
    shared String? osioToken = get("OSIO_TOKEN");
    shared String? osNamespace = get("OS_NAMESPACE");
    shared String? osMasterUrl = get("OS_MASTER_URL");
    shared String? osToken = get("OS_TOKEN");
    shared Boolean debugLogs = if (exists debug = get("DEBUG"))
            then debug.lowercased.trimmed == "true" else false;

    shared String? multiTenantCheServer = get("CHE_MULTITENANT_SERVER");
    shared String? cleanupSingleTenant = get("CLEANUP_SINGLE_TENANT");
    shared String? cheDestinationServer = get("CHE_DESTINATION_SERVER");
    shared String? serviceAccountId = get("SERVICE_ACCOUNT_ID");
    shared String? serviceAccountSecret = get("SERVICE_ACCOUNT_SECRET");
    shared String? authApiUrl = get("AUTH_API_URL");
    shared Integer commandTimeout =
            switch(val = Integer.parse(get("COMMAND_TIMEOUT") else "600"))
            case (is Integer) val
            else 600;
}


