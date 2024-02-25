# bedrockconnect-docker

Starting a [BedrockConnect](https://github.com/Pugmatt/BedrockConnect) server inside a docker-compose stack, including a
MariaDB server for storing user-data. Handling DNS requests to spoof Minecraft Bedrock edition servers are outside the
scope of this project (personally I spoof the DNS responses through my pfsense router).

## Docker image

The docker-compose.yml file in this project contains everything you need to run BedrockConnect in conjunection with a
MariaDB server. But, if you want to customize your docker-compose stack, you can adjust any BedrockConnect settings in
the environment variables as follows:

```yaml
services:
  bedrockconnect:
    build: './bedrockconnect'
    environment:
      BC_MYSQL_HOST: mymariadbserver.example.com
      BC_MYSQL_DB: bedrock-connect
      BC_MYSQL_USER: root
      BC_MYSQL_PASS: ''
      BC_CUSTOM_SERVERS: '/app/custom-servers.json'
    volumes:
      - './custom-servers.json:/app/custom-servers.json'
    ports:
      - '19132:19132/tcp'
      - '19132:19132/udp'
```

## Environment variables

The Docker image contains a script that converts environment variables starting with `BC_` to commandline arguments for
BedrockConnect.
See [BedrockConnect's documentation](https://github.com/Pugmatt/BedrockConnect?tab=readme-ov-file#hosting-your-own-serverlist-server)
for an up-to-date list of all available arguments, and see the table below for a few examples of common settings.

| Environment variable | Description                                                                                                                                                                                                          | Default value   |
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------|
| BC_MYSQL_HOST        | MySQL host                                                                                                                                                                                                           | localhost       |
| BC_MYSQL_DB          | MySQL database name                                                                                                                                                                                                  | bedrock-connect |
| BC_MYSQL_USER        | MySQL username                                                                                                                                                                                                       | root            |
| BC_MYSQL_PASS        | MySQL password                                                                                                                                                                                                       |                 |
| BC_CUSTOM_SERVERS    | Sets the path to a custom server file, for specifying your servers in the list for all players. See [custom servers](https://github.com/Pugmatt/BedrockConnect?tab=readme-ov-file#defining-your-own-custom-servers). |                 |
| BC_USER_SERVERS      | If true, players can add and remove servers on the serverlist. If false, the options are hidden.                                                                                                                     | true            |
| BC_FEATURED_SERVERS  | If true, the featured servers will be displayed in the serverlist. If false, the servers are hidden.                                                                                                                 | true            |
| BC_WHITELIST         | Specify file containing list of whitelisted players. (Should be a text file with the player names specified on seperate lines)                                                                                       |                 |
| BC_LANGUAGE          | Specify a file containing language customizations. See [guide for changing wording](https://github.com/Pugmatt/BedrockConnect?tab=readme-ov-file#change-wording-of-serverlist).                                      |                 |
