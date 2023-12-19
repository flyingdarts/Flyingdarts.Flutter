import http.server
import ssl
import os
import time

class CachedRequestHandler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.cache = {}

    def do_GET(self):
        # Check if the file is in the cache
        if self.path in self.cache:
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(self.cache[self.path])
            return

        # If not in the cache, serve the file as usual
        super().do_GET()

        # Cache the file
        if self.path not in self.cache:
            with open(self.path, 'rb') as f:
                self.cache[self.path] = f.read()

if __name__ == '__main__':
    server_address = ('', 8000)
    httpd = http.server.HTTPServer(server_address, CachedRequestHandler)

    # Path to your certificate and key files
    certfile = 'C:\\Users\\mikep\\OneDrive\\Bureaublad\\Flyingdarts\\apps\\frontend\\flutter\\localhost.crt'
    keyfile = 'C:\\Users\\mikep\\OneDrive\\Bureaublad\\Flyingdarts\\apps\\frontend\\flutter\\localhost.key'

    # Create an SSL context
    context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
    context.load_cert_chain(certfile, keyfile)

    # Wrap the HTTP server with the SSL context
    httpd.socket = context.wrap_socket(httpd.socket, server_side=True)

    print(f"Serving on port 8000 with HTTPS")
    httpd.serve_forever()
