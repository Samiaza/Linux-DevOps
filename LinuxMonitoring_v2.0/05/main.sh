#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Error: too few options"
elif [ $# -gt 1 ]; then
  echo "Error: too many options"
elif [[ ! $1 =~ ^[1234]$ ]]; then
  echo "Error: option must be integer [1234]"
else
  ./sorter.sh $1
fi

# HTTP response status codes:

# # 200 OK - The request succeeded.
# #
# # 201 Created - The request succeeded, and a new resource was created
# #     as a result.
# # 400 Bad Request - The server cannot or will not process the request
# #     due to an apparent client error.
# # 401 Unauthorized - Authentication is required and has failed or has
# #     not yet been provided.
# # 403 Forbidden - The request contained valid data and was understood
# #     by the server, but the server is refusing action.
# # 404 Not Found - The requested resource could not be found but may be
# #     available in the future.
# # 500 Internal Server Error - An unexpected condition was encountered
# #     and no more specific message is suitable.
# # 501 Not Implemented - The server either does not recognize the request
# #     method, or it lacks the ability to fulfil the request.
# # 502 Bad Gateway - The server was acting as a gateway or proxy and
# #     received an invalid response from the upstream server.
# # 503 Service Unavailable - The server cannot handle the request.
# #     Generally, this is a temporary state.
