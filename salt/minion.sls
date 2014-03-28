{% from "salt/salt-map.jinja" import saltvars with context %}

salt-minion:
  pkg.installed:
    - name: {{ saltvars['salt-minion'] }}
  file.managed:
    - name: {{ saltvars['conf_dir'] }}/minion
    - template: jinja
    - source: salt://salt/files/minion
  service.running:
    - enable: True
    - name: {{ saltvars['service-minion'] }}
    - watch:
      - pkg: salt-minion
      - file: salt-minion
