#!/usr/bin/env sh

clj -Sdeps '{:deps {nrepl {:mvn/version "0.5.3"}}}' -e '
(require (quote [nrepl.server :refer [start-server stop-server]]))

(defn- available-port []
  (with-open [s (java.net.ServerSocket. 0)]
    (.getLocalPort s)))

(let [port (available-port)]
  (defonce server (start-server :port port))
  (spit ".nrepl-port" port))
'
