---
external help file: PSTranslate-help.xml
Module Name: PSTranslate
online version:
schema: 2.0.0
---

# Add-TranslationApiKey

## SYNOPSIS
Stores API Keys for the APIs used to translate text.

## SYNTAX

```
Add-TranslationApiKey [-ApiKey] <String> [-Provider] <String> [-Force] [-Register] [<CommonParameters>]
```

## DESCRIPTION
Stores API Keys for the APIs used to translate text.

## EXAMPLES

### EXAMPLE 1
```
Add-TranslationApiKey -ApiKey 'c01d33ba-5af9-4528-b6be-61cdb94820c1' -Provider 'azure'
```

Adds an API key to connect to azure with.

## PARAMETERS

### -ApiKey
The API Key to store.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Overwrite existing API Keys

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Provider
The provider for which to store the API Key

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Register
Persist the API key, so it will be remembered in future sessions.
On Windows, this is written to registry using windows encryption.
On Linux this is stored in plaintext in file.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
