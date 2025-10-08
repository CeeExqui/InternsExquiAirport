codeunit 80500 "Feature Flag Testing"
{
    procedure IsEnabled(InquiredFeature: Text): Boolean
    var
        Client: HttpClient;
        Resp: HttpResponseMessage;
        Headers: HttpHeaders;
        Txt: Text;

        JsonArr: JsonArray;
        Item: JsonToken;
        Obj: JsonObject;
        FeatureObj: JsonObject;
        FeatureToken: JsonToken;
        NameTok: JsonToken;
        NameVal: JsonValue;
        EnabledTok: JsonToken;
        EnabledVal: JsonValue;

        FeatureName: Text;
        Enabled: Boolean;

        EnvKey: Label 'ZzpzF773ZqvuaoQ5Sz5Qoo', Locked = true;
        Url: Label 'https://edge.api.flagsmith.com/api/v1/flags/';
    begin
        headers := Client.DefaultRequestHeaders();
        Headers.Add('X-Environment-Key', EnvKey);
        if not Client.Get(Url, Resp) then begin
            Message('HTTP call failed');
            exit;
        end;

        if not Resp.IsSuccessStatusCode() then begin
            Message('HTTP error: %1', Resp.HttpStatusCode());
            exit;
        end;

        Resp.Content().ReadAs(Txt);
        if not JsonArr.ReadFrom(Txt) then begin
            Message('Could not parse JSON.');
            exit;
        end;

        foreach Item in JsonArr do begin
            Obj := Item.AsObject();
            if Obj.Get('feature', FeatureToken) then begin
                FeatureObj := FeatureToken.AsObject();

                if FeatureObj.Get('name', NameTok) then begin
                    //NameVal := NameTok.AsValue();
                    FeatureName := NameTok.AsValue().AsText();

                    if FeatureName = InquiredFeature then begin
                        if Obj.Get('enabled', EnabledTok) then begin
                            //EnabledVal := EnabledTok.AsValue();
                            Enabled := EnabledTok.AsValue().AsBoolean();
                            Message('featureflag1 is %1', Format(Enabled));
                            exit(Enabled);
                        end;
                    end;
                end;
            end;
        end;

        Message('featureflag1 not found.');
    end;



    procedure HideRecords(StartDate: DateTime; EndDate: DateTime; CreatedBy: Guid): Text
    var

        FinalView: Text[200];

    begin
        FinalView := 'VERSION(1) WHERE(2000000001=FILTER(..' +
        Format(StartDate, 0, 9) + '|' +
        Format(EndDate, 0, 9) + '..),' +
        '2000000002=FILTER(' + Format(CreatedBy) + '))';

        exit(FinalView);


    end;
}
