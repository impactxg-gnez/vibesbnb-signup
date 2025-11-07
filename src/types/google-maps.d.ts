declare global {
  interface Window {
    google?: {
      maps: {
        places: {
          Autocomplete: new (input: HTMLInputElement, options?: any) => {
            addListener: (event: string, callback: () => void) => void;
            getPlace: () => {
              geometry?: {
                location: {
                  lat: () => number;
                  lng: () => number;
                };
              };
              formatted_address?: string;
              name?: string;
              place_id?: string;
            };
          };
        };
      };
    };
  }
}

export {};


