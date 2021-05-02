# Namecheap Dynamic DNS Updater (Basic)

Just a simple *bash + cURL* based updater for the Namecheap Dynamic DNS service.
Works on macOS, probably Linux, and probably not Windows.

## Configuration

* Make a copy of the example configuration file `nc-ddns.config.example.sh` and 
  name it `nc-ddns.config.sh`.
* Fill in the configuration values in that file from 
  Namecheap's web control panel:

```
NC_DDNS_HOST=@
NC_DDNS_DOMAIN=mydomain.com
NC_DDNS_PASSWORD=ddns_password
```

## Usage

```
$ ./nc-ddns.sh
```

## History

This updater was written as an alternative to the [nc-ddns] updater,
because I couldn't get that updater to work.

[nc-ddns]: https://github.com/marcov/nc-ddns
