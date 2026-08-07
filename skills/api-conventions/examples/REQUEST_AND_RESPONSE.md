# API CONVENTIONS

Examples of HTTP Request and Response objects notatated in TypeScript format.

## REQUESTS

### POST

DBRecord = {
  [key:string]: any;
}

APIRequest = {
  data: DBRecord;
}

## RESPONSES

Pagination = {
  total: number;
  offset: number;
  limit: number;
}

Error = {
  [key:string]: string;
}

APIResponse = {
  message: string;
  data: Array<object>;
  pagination: Pagination | null;
  errors: Array<Error> | null;
}