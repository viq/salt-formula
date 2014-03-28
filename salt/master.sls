{% from "salt/salt-map.jinja" import saltvars with context %}

salt-master:
  pkg.installed:
    - name: {{ saltvars['salt-master'] }}
  file.managed:
    - name: {{ saltvars['conf_dir'] }}/master
    - template: jinja
    - source: salt://salt/files/master
  service.running:
    - enable: True
    - name: {{ saltvars['service-master'] }}
    - watch:
      - pkg: salt-master
      - file: salt-master
