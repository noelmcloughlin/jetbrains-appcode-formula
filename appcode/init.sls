# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import appcode with context %}

    {%- if grains.kernel|lower in ('darwin',) %}

include:
  - .macapp
  - .config

    {%- else %}

appcode-not-available-to-install:
  test.show_notification:
    - text: |
        The appcode package is unavailable for {{ salt['grains.get']('finger', grains.os_family) }}

    {%- endif %}
