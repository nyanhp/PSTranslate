---
external help file: PSTranslate-help.xml
Module Name: PSTranslate
online version:
schema: 2.0.0
---

# Add-TranslationApiKey

## SYNOPSIS
Hinterlegt API-Keys zur Übersetzung von Text.

## SYNTAX

```
Add-TranslationApiKey [-ApiKey] <String> [-Provider] <String> [-Force] [-Register] [<CommonParameters>]
```

## DESCRIPTION
Hinterlegt API-Keys zur Übersetzung von Text.

## EXAMPLES

### EXAMPLE 1
```
Add-TranslationApiKey -ApiKey 'c01d33ba-5af9-4528-b6be-61cdb94820c1' -Provider 'azure'
```

Fügt temporär einen Azure API Key hinzu.

## PARAMETERS

### -ApiKey
Der API-Key, der gespeichert werden soll

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
Gibt an, dass bestehende Keys überschrieben werden

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
Der Anbieter, für den ein API-Key hinterlegt werden soll

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
Registriert den API-Key, um ihn später automatisch verwenden
zu können.
Windows: Verschlüsselte Ablage in Registry
Linux: Unverschlüsselte Ablage in Dateisystem

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
Dieses Cmdlet unterstützt die Common Parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, und -WarningVariable. Weitere Informationen: [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
