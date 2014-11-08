backend www1 {
  .host = "192.168.2.3";
  .port = "80";
}

backend www2 {
  .host = "192.168.2.4";
  .port = "80";
}

director www random {
  { .backend = www1; .weight = 1; }
  { .backend = www2; .weight = 1; }
}

sub vcl_recv {
  set req.backend = www;

  # For testing ONLY; we want to make sure load balancing is working correctly.
  return (pass);
}
